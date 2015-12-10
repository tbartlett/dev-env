install_dir=/opt/df_linux
init="${install_dir}/data/init/init.txt"
d_init="${install_dir}/data/init/d_init.txt"

sed -i 's/SOUND:\w*/SOUND:NO/g' "$init"
sed -i 's/INTRO:\w*/INTRO:NO/g' "$init"
sed -i 's/FPS:\w*/FPS:YES/g' "$init"

sed -i 's/AUTOSAVE:\w*/AUTOSAVE:SEASONAL/g' "$d_init"
sed -i 's/COFFIN_NO_PETS_DEFAULT:\w*/COFFIN_NO_PETS_DEFAULT:YES/g' "$d_init"
sed -i 's/ENGRAVINGS_START_OBSCURED:\w*/ENGRAVINGS_START_OBSCURED:YES/g' "$d_init"
sed -i 's/SHOW_FLOW_AMOUNTS:\w*/SHOW_FLOW_AMOUNTS:YES/g' "$d_init"




