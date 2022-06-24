#modloaded mysticalcreations

# Mystical Creations Recipes
recipes.addShaped(<extendedcrafting:material:33>*3, [[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>],[<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>], [<mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>, <mysticalcreations:ultimate_essence>]]);
mods.astralsorcery.Lightwell.addLiquefaction(<mysticalcreations:astral_starmetal_essence>, <liquid:starmetal>, 0.5, 0.2, 0x040D67);
recipes.addShaped(Bucket("creosote"), [[null, <mysticalcreations:creosolite_essence>, null],[<mysticalcreations:creosolite_essence>, <minecraft:bucket>.noReturn(), <mysticalcreations:creosolite_essence>], [null, <mysticalcreations:creosolite_essence>, null]]);

# Add Mystical Creations processing in Insolator
scripts.process.grow(<mysticalcreations:creosolite_seeds>, <mysticalcreations:creosolite_essence> * 9, "No exceptions", <mysticalcreations:creosolite_seeds>, 1);
scripts.process.grow(<mysticalcreations:cheese_seeds>, 		<mysticalcreations:cheese_essence> * 9,      "No exceptions", <mysticalcreations:cheese_seeds>, 1);
scripts.process.grow(<mysticalcreations:astral_starmetal_seeds>, 		<mysticalcreations:astral_starmetal_essence> * 9,      "No exceptions", <mysticalcreations:astral_starmetal_seeds>, 1);
scripts.process.grow(<mysticalcreations:ultimate_seeds>,   <mysticalcreations:ultimate_essence> * 9,   "only: Hydroponics", <mysticalcreations:ultimate_seeds>, 1);
