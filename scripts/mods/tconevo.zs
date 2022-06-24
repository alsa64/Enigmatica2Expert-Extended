import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

#modloaded tconevo

for item in loadedMods["tconevo"].items {
  for ore in item.ores {
    if (ore.name.startsWith("gear")) recipes.remove(item);
  }
}

# [Darkwood Shard]*8 from [Lightwood Wood]
craft.make(<tconstruct:shard>.withTag({Material: "darkwood"}) * 16, ["##"], {
  "#": <advancedrocketry:alienwood>, # Lightwood Wood
});

# [Darkwood Shard]*4 from [Lightwood planks]
craft.make(<tconstruct:shard>.withTag({Material: "darkwood"}) * 8, ["# ", " #"], {
  "#": <advancedrocketry:planks>, # Lightwood planks
});