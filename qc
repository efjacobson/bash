#! /bin/bash

sed -i.bu 's/_______/KC_TRNS/g' keyboards/keebio/quefrency/keymaps/efjacobson/keymap.c
qmk compile
sed -i.bu 's/KC_TRNS/_______/g' keyboards/keebio/quefrency/keymaps/efjacobson/keymap.c
rm keyboards/keebio/quefrency/keymaps/efjacobson/keymap.c.bu