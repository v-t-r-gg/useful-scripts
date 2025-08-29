# Useful Scripts

Collection of various useful scripts.

## GIMP Layer Merge Scripts

2 GIMP plugins to merge layers efficiently (applying filters or layers to GIF frames).

### Python Script: `merge_active_into_others.py`

Duplicates the active layer and merges it into all other layers.

#### Installation

1. Download `merge_active_into_others.py`.
2. Copy to `~/.config/GIMP/2.10/plug-ins/`.
3. Run `chmod +x ~/.config/GIMP/2.10/plug-ins/merge_active_into_others.py`.
4. Restart GIMP.

#### Usage

- Select a layer, then `Filters > Merge Active into Others`.

### Scheme Script: `merge-layer-to-all-others.scm`

Merges the top layer into all other layers.

#### Installation

1. Download `merge-layer-to-all-others.scm`.
2. Copy to `~/.config/GIMP/2.10/scripts/`.
3. Restart GIMP.

#### Usage

- Set the top layer, then `Filters > Merge Layer to All Others`.

#### Requirements

- GIMP 2.10+.
- Python 2 for `.py` (e.g., `yay -S python2` on Arch Linux).

## Music Organizer Script (Bash): `organize_music_by_artist.sh`

Organizes FLAC album directories by artist metadata.

### Usage

1. Set `MUSIC_DIR` to your music directory in the script.
2. Run the script: `./organize_music_by_artist.sh`.

Requires `metaflac` (from FLAC tools).
