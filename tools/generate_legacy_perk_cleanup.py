"""Generate bounded legacy cleanup from reviewed block/entity layout data.

The layouts describe the retired templates; no structure files are needed at runtime.
Block properties are deliberately ignored so powered lamps and changed stair states
still match. Different replacement block types are preserved.
"""
from pathlib import Path
import json,math

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'zombies_build_kit/data/zbk/function/map_elements/perks/machines/legacy'
PROFILES=json.loads(Path(__file__).with_name('legacy_perk_layouts.json').read_text())
ROTATIONS={'south':('counterclockwise_90',(-1,0,0),'-45..45'), 'west':('none',(0,0,-1),'45..135'), 'north':('clockwise_90',(1,0,0),'135..180'), 'east':('180',(0,0,1),'-135..-45')}

def rotate(pos,rotation,entity=False):
    x,y,z=pos
    one=1 if entity else 0
    if rotation=='counterclockwise_90':return (z,y,one-x)
    if rotation=='clockwise_90':return (one-z,y,x)
    if rotation=='180':return (one-x,y,one-z)
    return (x,y,z)

def coord(pos):return ' '.join('~'+format(v,'.8g') if v else '~' for v in pos)
def put(name,lines):
    path=OUT/(name+'.mcfunction');path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text('\n'.join(lines)+'\n')

dispatch=['# Called at the persistent placement marker before deleting its runtime.',
          'execute if entity @s[tag=pm_native] run return 0',
          '# Missing old orientation: do not guess which neighboring blocks belong to it.',
          'execute unless score @s playerYaw matches -180..180 run return 0']
for name,profile in PROFILES.items():
    tag='wunderfizz' if name=='wunderfizz' else 'perk_'+name
    for side,(rotation,offset,yaw) in ROTATIONS.items():
        if name=='wunderfizz':
            # Legacy Wunderfizz's marker is embedded in the template at this offset.
            offset=tuple(-math.floor(v) for v in rotate((.5,2.125,1.5),rotation,True))
        path=f'{name}/{side}'
        prefix=f'execute if entity @s[tag={tag}] if score @s playerYaw matches '
        suffix=f' align xyz run function zbk:map_elements/perks/machines/legacy/{path}'
        dispatch.append(prefix+yaw+suffix)
        if side=='north':dispatch.append(prefix+'-180..-135'+suffix)
        lines=['# Generated from tools/legacy_perk_layouts.json; coordinates relative to aligned marker.']
        # Clean entities before blocks so block update drops cannot mask original entities.
        for entity in profile['entities']:
            pos=tuple(a+b for a,b in zip(rotate(entity['pos'],rotation,True),offset))
            filters=[f'type={entity["type"]}','tag=!pm_runtime','tag=!pm_v2_runtime','distance=..0.15']
            filters.extend('tag='+tag for tag in entity.get('tags',[]))
            if entity['type']=='text_display' and not entity['tags']:
                filters.append('nbt={text:{text:'+json.dumps(entity['text'])+'}}')
            lines.append(f'execute positioned {coord(pos)} run kill @e['+','.join(filters)+']')
        for block in profile['blocks']:
            if block['block'] in ('minecraft:air','minecraft:structure_void'):continue
            pos=tuple(a+b for a,b in zip(rotate(block['pos'],rotation),offset))
            c=coord(pos)
            lines.append(f'execute if block {c} {block["block"]} run setblock {c} air')
        put(path,lines)
put('cleanup',dispatch)
print('Generated legacy cleanup for seven machines in four orientations.')
