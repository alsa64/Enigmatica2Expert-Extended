import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

#priority 3999
#loader crafttweaker reloadableevents

utils.DEBUG = true;

function giveChest(player as IPlayer, items as IItemStack[]) as void {
  var tag = {
    BCTileData: {
      Items: []
    },
  } as IData;
  for i, item in items {
    tag = tag + {BCTileData: {Items: [item as IData + {Slot: i as short} as IData]}} as IData;
  }
  player.give(<draconicevolution:draconium_chest>.withTag(tag));
}

function dumpLightSources(player as IPlayer) as void {
  for light in 13 .. 16 {
    var items = [] as IItemStack[];
    var ids = [] as string[];
    for i,block in game.blocks {
      val ll = block.lightLevel;
      if(ll <= 0) continue;
      utils.log(ll, block.id);

      if(ll == light) {
        ids += block.id;
      }
    }
    mods.ctintegration.util.ArrayUtil.sort(ids);
    for id in ids {
      val item = itemUtils.getItem(id);
      if(!isNull(item)) items += item;
      else utils.log('Light without item:', id);
    }
    giveChest(player, items);
  }
}

events.onPlayerLeftClickBlock(function(e as crafttweaker.event.PlayerLeftClickBlockEvent){
  if(e.player.world.isRemote()) return;
  if(isNull(e.player.currentItem) || !(<minecraft:stick> has e.player.currentItem)) return;

  e.player.sendMessage("§eLeft Clicked§r");
  dumpLightSources(e.player);
  e.player.sendMessage("§8Done!§r");


  // val ingrs = <ore:dirt> | <ore:grass>;
  // var blockIngr as IBlock = null;
  // for item in ingrs.items {
  //   val b = item.asBlock();
  //   if(isNull(b)) continue;

  //   if(isNull(blockIngr)) blockIngr = b;
  //   else blockIngr = blockIngr | b;
  // }
  // e.player.sendMessage('dirt|grass:§a '~(blockIngr has e.block));

  // val world = e.player.world;
  // val pPos = e.player.position3f.asBlockPos();
  // e.player.sendMessage('getVis:§a '~world.getVis(pPos));
  // e.player.sendMessage('getFlux:§a '~world.getFlux(pPos));
  // e.player.sendMessage('getAuraBase:§a '~world.getAuraBase(pPos));
  // e.player.sendMessage('getTotalAura:§a '~world.getTotalAura(pPos));

  // if (world.getVis(pPos) == 0) {
  //   world.addVis(pPos, 222.0f);
  // }

  // print(e.player.world.getCustomWorldData() as string);

  //   giveChest(e.player, [
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 151, TrophyVariant: "gold", TrophyColorBlue: 140, TrophyName: "§cAnimals Master Trophy§r",         TrophyColorRed: 168, TrophyItem: {id: "draconicevolution:mob_soul", Count: 1 as byte, tag: {EntityName: "minecraft:cow"}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 209, TrophyVariant: "gold", TrophyColorBlue: 0,   TrophyName: "§2Twilight Forest Master Trophy§r", TrophyColorRed: 31,  TrophyItem: {id: "twilightforest:miniature_structure", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 38,  TrophyVariant: "gold", TrophyColorBlue: 35,  TrophyName: "§4Utils Master Trophy§r",           TrophyColorRed: 104, TrophyItem: {id: "openblocks:hang_glider", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 110, TrophyVariant: "gold", TrophyColorBlue: 107, TrophyName: "§fIC2 Master Trophy§r",             TrophyColorRed: 175, TrophyItem: {id: "ic2:te", Count: 1 as byte, Damage: 2 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 143, TrophyVariant: "gold", TrophyColorBlue: 39,  TrophyName: "§aForestry Master Trophy§r",        TrophyColorRed: 62,  TrophyItem: {id: "forestry:bee_queen_ge", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 48,  TrophyVariant: "gold", TrophyColorBlue: 35,  TrophyName: "§cImmersive Engineering Trophy§r",  TrophyColorRed: 130, TrophyItem: {ForgeCaps: {Parent: {Size: 3, Items: []}}, id: "immersiveengineering:railgun", Count: 1 as byte, tag: {"IE:Shader": {id: "immersiveengineering:shader", Count: 1 as byte, tag: {shader_name: "The Kindled"}, Damage: 0 as short}}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 88,  TrophyVariant: "gold", TrophyColorBlue: 171, TrophyName: "§dMekanism Master Trophy§r",        TrophyColorRed: 169, TrophyItem: {id: "mekanism:energycube", Count: 1 as byte, tag: {tier: 3}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 171, TrophyVariant: "gold", TrophyColorBlue: 55,  TrophyName: "§eExtraUtils Master Trophy§r",      TrophyColorRed: 228, TrophyItem: {id: "extrautils2:suncrystal", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 57,  TrophyVariant: "gold", TrophyColorBlue: 46,  TrophyName: "§9Actually Additions Trophy§r",     TrophyColorRed: 74,  TrophyItem: {id: "actuallyadditions:block_giant_chest_large", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 47,  TrophyVariant: "gold", TrophyColorBlue: 190, TrophyName: "§5Thaumcraft Master Trophy§r",      TrophyColorRed: 123, TrophyItem: {id: "thaumicaugmentation:rift_jar", Count: 1 as byte, tag: {seed: 0, size: 100}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 240, TrophyVariant: "gold", TrophyColorBlue: 240, TrophyName: "§1Astralsorcery Master Trophy§r",   TrophyColorRed: 240, TrophyItem: {id: "astralsorcery:blockcelestialcollectorcrystal", Count: 1 as byte, Damage: 0 as short, tag: {astralsorcery: {collectorType: 1}}}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 127, TrophyVariant: "gold", TrophyColorBlue: 181, TrophyName: "§bBotania Master Trophy§r",         TrophyColorRed: 71,  TrophyItem: {id: "botania:pool", Count: 1 as byte, tag: {RenderFull: 1 as byte}, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 49,  TrophyVariant: "gold", TrophyColorBlue: 44,  TrophyName: "§4Blood Master Trophy§r",           TrophyColorRed: 179, TrophyItem: {id: "bloodmagic:altar", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 207, TrophyVariant: "gold", TrophyColorBlue: 42,  TrophyName: "§eNuclear Master Trophy§r",         TrophyColorRed: 222, TrophyItem: {id: "nuclearcraft:rtg_plutonium", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 129, TrophyVariant: "gold", TrophyColorBlue: 152, TrophyName: "§7Industrial Foregoing Trophy§r",   TrophyColorRed: 216, TrophyItem: {id: "industrialforegoing:infinity_drill", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 118, TrophyVariant: "gold", TrophyColorBlue: 151, TrophyName: "§8RFTools Master Trophy§r",         TrophyColorRed: 40,  TrophyItem: {id: "rftools:infused_diamond", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 38,  TrophyVariant: "gold", TrophyColorBlue: 86,  TrophyName: "§0EnderIO Master Trophy§r",         TrophyColorRed: 33,  TrophyItem: {id: "enderio:block_enhanced_sag_mill", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 99,  TrophyVariant: "gold", TrophyColorBlue: 88,  TrophyName: "§6Thermal Expansion Trophy§r",      TrophyColorRed: 49,  TrophyItem: {id: "thermalexpansion:frame", Count: 2 as byte, Damage: 148 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 222, TrophyVariant: "gold", TrophyColorBlue: 146, TrophyName: "§bRocketry Master Trophy§r",        TrophyColorRed: 152, TrophyItem: {id: "libvulpes:elitemotor", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 89,  TrophyVariant: "gold", TrophyColorBlue: 149, TrophyName: "§3Applied Energetics Trophy§r",     TrophyColorRed: 126, TrophyItem: {id: "chisel:futura", Count: 1 as byte, Damage: 2 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 127, TrophyVariant: "gold", TrophyColorBlue: 181, TrophyName: "§dEnvirTech Master Trophy§r",       TrophyColorRed: 71,  TrophyItem: {id: "environmentaltech:void_res_miner_cont_5", Count: 1 as byte, Damage: 0 as short}}),
  // <simple_trophies:trophy>.withTag({TrophyColorGreen: 128, TrophyVariant: "gold", TrophyColorBlue: 43,  TrophyName: "§6Draconic Evolution Trophy§r",     TrophyColorRed: 200, TrophyItem: {id: "draconicevolution:reactor_core", Count: 1 as byte, Damage: 0 as short}}),
  //   ]);
});