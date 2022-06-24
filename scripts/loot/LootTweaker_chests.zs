import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.item.IItemStack as IItemStack;
import loottweaker.vanilla.loot.Functions;

#modloaded loottweaker

#ignoreBracketErrors

val caveloot = [
	<environmentaltech:litherite_crystal>,
	<bigreactors:ingotblutonium>,
	<ic2:nuclear:7>,
	<minecraft:gold_block>,
	<thermalfoundation:material:70>,
	<extendedcrafting:storage>,
	<nuclearcraft:uranium:8>,
	<nuclearcraft:neptunium>,
	<nuclearcraft:plutonium>,
	<nuclearcraft:californium:4>,
	<nuclearcraft:californium:12>,
	<nuclearcraft:curium>,
	<actuallyadditions:block_crystal>,
	<actuallyadditions:block_crystal:1>,
	<actuallyadditions:block_crystal:2>,
	<actuallyadditions:block_crystal:3>,
	<actuallyadditions:block_crystal:4>,
	<actuallyadditions:item_crystal_empowered>,
	<actuallyadditions:item_crystal_empowered:1>,
	<actuallyadditions:item_crystal_empowered:2>,
	<actuallyadditions:item_crystal_empowered:3>,
	<actuallyadditions:item_crystal_empowered:4>,
	<actuallyadditions:item_crystal_empowered:5>,
	<botania:manaring>.withTag({mana: 500000}),
	<botania:auraring>,
	<botania:magnetring>,
	<mysticalagriculture:prudentium_apple>,
	<mysticalagriculture:intermedium_apple>,
	<mysticalagriculture:superium_apple>,
	<biomesoplenty:gem:6>,
	<thermalfoundation:storage_alloy>,
] as IItemStack[];

function addLootList(table as string, pool as string, map as int[IItemStack], countMin as int = 0, countMax as int = 0) {
	val loot_pool = loottweaker.LootTweaker.getTable(table).getPool(pool);
	for item, weight in map {
		if(isNull(item)) continue;
		if(countMin <= 0 || countMax <= 0)
			loot_pool.addItemEntry(item, weight);
		else
			loot_pool.addItemEntryHelper(item, weight, 0, [Functions.setCount(countMin, max(countMin, countMax))], []);
	}
}

addLootList(
	"quark:chests/pirate_chest",
	"quark:pirate_ship", {
	<cyclicmagic:dynamite_safe>   : 30,
	<cyclicmagic:dynamite_mining> : 10,
	<cyclicmagic:ender_tnt_6>     : 20,
	<ic2:dynamite>                : 60,
	<ic2:dynamite_sticky>         : 50,
	<quark:arrow_explosive>       : 80,
	<tconstruct:throwball:1>      : 5,
	<mekanism:obsidiantnt>        : 5,
}, 5, 64);

addLootList(
	"twilightforest:structures/hill_3/uncommon",
	"main", {
	<twilightforest:steeleaf_ingot> : 5,
}, 2, 8);
