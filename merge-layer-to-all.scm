(define (script-fu-merge-layer-to-all-others image drawable)
  (let* ((layers (gimp-image-get-layers image))
         (num-layers (car layers))
         (layer-array (cadr layers)))
    (if (< num-layers 2)
        (begin
          (gimp-message "Error: Image must have at least 2 layers (filter layer + 1 target layer).")
          (return)))

    (gimp-image-undo-group-start image)

    (let ((i 1))
      (while (< i num-layers)
        (let* ((layers (gimp-image-get-layers image))
               (layer-array (cadr layers))
               (filter-layer (aref layer-array 0))
               (target-layer (aref layer-array i))
               (filter-copy (car (gimp-layer-copy filter-layer TRUE))))
          (gimp-message (string-append "Processing layer " (number->string i)
                                       " filter ID: " (number->string filter-layer)
                                       " copy ID: " (number->string filter-copy)))
          (gimp-image-insert-layer image filter-copy 0 0)
          (gimp-image-reorder-item image filter-copy 0 i)
          (gimp-image-merge-down image filter-copy 1))
        (set! i (+ i 1))))

    (gimp-image-undo-group-end image)
    (gimp-displays-flush)))

(script-fu-register "script-fu-merge-layer-to-all-others"
                    "Merge Layer to All Others"
                    "Merges the top layer (filter) into all other layers"
                    "v-t-r-gg"
                    "na"
                    "2025"
                    "RGB*, GRAY*"
                    SF-IMAGE    "Image"    0
                    SF-DRAWABLE "Drawable" 0)

(script-fu-menu-register "script-fu-merge-layer-to-all-others" "<Image>/Filters")
