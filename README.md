# gimp layer merge scripts

2 gimp plugins to merge layers efficiently (applying filters or layers gif frames)

## python script: `merge_active_into_others.py`
duplicates the active layer and merges it into all other layers.

### installation
1. download `merge_active_into_others.py`
2. copy to `~/.config/GIMP/2.10/plug-ins/`
3. run `chmod +x ~/.config/GIMP/2.10/plug-ins/merge_active_into_others.py`
4. restart gimp.

### Usage
- select a layer, then `Filters > Merge Active into Others`

## scheme script: `merge-layer-to-all-others.scm`
Merges the top layer into all other layers

### installation
1. download `merge-layer-to-all-others.scm`
2. copy to `~/.config/GIMP/2.10/scripts/`
3. restart GIMP.

### usage
- Set the top layer, then `Filters > Merge Layer to All Others`

## requirements
- gimp 2.10+
- python 2 for `.py` (ie. `yay -S python2` on arch linux)
