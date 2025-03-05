#!/usr/bin/env python2
from gimpfu import *

def merge_active_into_others(image, drawable):
    special_layer = image.active_layer
    if not special_layer:
        pdb.gimp_message("No active layer selected")
        return

    target_layers = [layer for layer in image.layers if layer != special_layer]
    if not target_layers:
        pdb.gimp_message("No other layers to merge into")
        return

    pdb.gimp_image_undo_group_start(image)

    try:
        for layer in target_layers:
            special_dup = special_layer.copy()
            pos = image.layers.index(layer)
            image.add_layer(special_dup, pos)
            pdb.gimp_image_merge_down(image, special_dup, CLIP_TO_IMAGE)

        pdb.gimp_displays_flush()

    except Exception as e:
        pdb.gimp_message("Error during merging: %s" % str(e))

    finally:
        pdb.gimp_image_undo_group_end(image)

register(
    "merge_active_into_others",
    "Merge active layer into all other layers",
    "Duplicates the active layer and merges it into each of the other layers",
    "v-t-r-gg",
    "na",
    "2025",
    "Merge Active into Others",
    "*",
    [
        (PF_IMAGE, "image", "Input image", None),
        (PF_DRAWABLE, "drawable", "Input drawable", None)
    ],
    [],
    merge_active_into_others,
    menu="<Image>/Filters"
)

main()
