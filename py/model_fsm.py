from graphviz import Digraph

fsm_up = 'ESTADO\nSOBE'
fsm_down = 'ESTADO\nDESCE'
dmu = 'ESTADO\nDMU'
dcm = 'ESTADO\nDCM'
chegou_up = 'CHEGOU\nCIMA'
chegou_down = 'CHEGOU\nBAIXO'
stop = 'PARADO'

f = Digraph('finite_state_machine', filename='fsm.cv')
f.attr(rankdir='LR', size='100')

f.attr('node', shape='doublecircle')
f.node(fsm_up)
f.node(fsm_down)
f.node(chegou_up)
f.node(chegou_down)

f.attr('node', shape='circle')
f.edge(fsm_up, chegou_up, label='3-1')
f.edge(chegou_up, chegou_up, label='tempo')
f.edge(chegou_up, dmu, label='')
f.edge(dmu, fsm_up, label='4-1')
f.edge(dmu, stop, label='3-1')
f.edge(stop, stop, label='000')
f.edge(stop, fsm_up, label='1-1')
f.edge(stop, fsm_down, label='1-2')
f.edge(fsm_down, chegou_down, label='1-2')
f.edge(chegou_down, chegou_down, label='tempo')
f.edge(chegou_down, dcm, label='2-1')
f.edge(dcm, fsm_down, label='4-2')
f.edge(dcm, stop, label='3-2')

f.view()
