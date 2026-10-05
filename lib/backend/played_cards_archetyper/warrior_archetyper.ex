# credo:disable-for-this-file Credo.Check.Refactor.CyclomaticComplexity
defmodule Backend.PlayedCardsArchetyper.WarriorArchetyper do
  @moduledoc false

  import Backend.PlayedCardsArchetyper.ArchetyperHelper

  @pirate_warrior_excludes [
    "Brood Keeper",
    "Darkrider",
    "Darkscale Broodmother",
    "Petal Peddler",
    "Prescient Slitherdrake",
    "Shadowed Informant",
    "Windpeak Wyrm"
  ]
  @dragon_warrior_excludes [
    "Blastpowder Engineer",
    "Cannonmaster",
    "Captain Crowley",
    "Follow the Fuse",
    "Hook n' Heave",
    "Hand Cannon",
    "Land Ho!",
    "Sky Raider",
    "Southsea Captain"
  ]
  @standard_config [
    "Quest Warrior": ["Enter the Lost City"],
    "Dragon Warrior":
      {[
         "Brood Keeper",
         "Prescient Slitherdrake",
         "Petal Peddler",
         "Carrier Whelp",
         "Darkscale Broodmother",
         "Windpeak Wyrm",
         "Darkrider"
       ], @dragon_warrior_excludes},
    "Pirate Warrior":
      {[
         "Southsea Captain",
         "Follow the Fuse",
         "Sky Raider"
       ], @pirate_warrior_excludes},
    "Dragon Warrior": [
      "Brood Keeper",
      "Prescient Slitherdrake",
      "Petal Peddler",
      "Carrier Whelp",
      "Darkscale Broodmother",
      "Windpeak Wyrm",
      "Darkrider"
    ],
    "Pirate Warrior": {["Southsea Captain", "Follow the Fuse", "Sky Raider"], @pirate_warrior_excludes},
    # 5.5
    "Harold Warrior": [
      "Scorching Ravager",
      "Cataclysmic War Axe"
    ],
    "Pirate Warrior": {["Living Flame", "Blastpowder Engineer"], @pirate_warrior_excludes},
    "Egg Warrior": [
      "Holy Eggbearer",
      "The Egg of Khelos",
      "Siphoning Growth",
      "Endbringer Umbra",
      "Unleash the Crocolisks",
      "Decimation"
    ],
    "Pirate Warrior": {["Hand Cannon"], @pirate_warrior_excludes},
    "Dragon Warrior": ["Stadium Announcer"],
    # 10.5
    "Logosh Warrior": [
      "Acolyte of Pain",
      "Slam",
      "Nightmare Lord Xavius",
      "Axe of the Forefathers",
      "Precursory Strike",
      "Shield Block"
    ],
    "Pirate Warrior": [
      "Eternal Toil"
    ],
    "Dragon Warrior": [
      "Cannonmaster",
      "Hook n' Heave",
      "Mother Duck",
      "Shadowflame Suffusion",
      "Searing Fissure",
      "Sanguine Depths",
      "Erupting Volcano"
    ],
    "Pirate Warrior": ["Land Ho!", "Captain Crowley"]
  ]
  @wild_config [
    "Odd Warrior": [{:start_of_game, ["Baku the Mooneater"]}, "Baku the Mooneater"],
    "Even Warrior": [{:start_of_game, ["Genn Greymane"]}, "Genn Greymane"],
    "XL Taunt Warrior": [
      "Far Watch Post",
      "Imposing Anubisath",
      "Miracle Salesman",
      "Plucky Paintfin",
      "Power Slider",
      "Scrap Golem",
      "Tar Slime",
      "The One-Amalgam Band"
    ],
    "Taunt 'n' Roll Warrior":
      {[{:all, ["Blackrock 'n' Roll", "Unlucky Powderman"]}], ["Enter the Lost City"]},
    "XL LC Quest Warrior": ["Blast Tortoise", "Eredar Brute", "Unlucky Powderman"],
    "XL HL LC Quest Warrior": ["Enter the Lost City"],
    "JtU Quest Warrior": ["Fire Plume's Heart"],
    "SoU Quest Warrior": ["Hack the System"],
    "Boar Warrior": ["Elwynn Boar"],
    "Tog Warrior": ["King Togwaggle"],
    "Handbuff Warrior": ["Anima Extractor"],
    "Rock 'n' Roll Warrior": ["Blackrock 'n' Roll"],
    "XL HL Igneous Warrior": [
      "Astalor Bloodsworn",
      "Bladestorm",
      "Bob the Bartender",
      "Boomboss Tho'grun",
      "Brawl",
      "Bulwark of Azzinoth",
      "Card Grader",
      "Deepminer Brann",
      "Dirty Rat",
      "Drywhisker Armorer",
      "Hamm, the Hungry",
      "Iceblood Garrison",
      "Lord Barov",
      "Marin the Manager",
      "Mutanus the Devourer",
      "New Heights",
      "Prince Renathal",
      "Quality Assurance",
      "Reno Jackson",
      "Reno, Lone Ranger",
      "Skulking Geist",
      "Sleep Under the Stars",
      "Sleepy Resident",
      "Theotar, the Mad Duke",
      "Ysera, Emerald Aspect",
      "Zephrys the Great",
      "Zilliax Deluxe 3000",
      "Zola the Gorgon"
    ],
    "Sul'thraze Odyn Warrior": [{:all, ["Sul'thraze", "Odyn, Prime Designate"]}],
    "Basher Warrior": ["Barricade Basher"],
    "Gauntlet Warrior": [{:all, ["Bladed Gauntlet", "Bloodsail Raider"]}],
    "Warsong Warrior": ["Warsong Commander"],
    "Mecha'thun Warrior": ["Mecha'thun"],
    "DMH Warrior": ["Dead Man's Hand"],
    "Hydration Warrior": ["Hydration Station"],
    "Rivendare Warrior": ["Rivendare, Warrider"],
    "Chad Warrior": ["Thaddius, Monstrosity"],
    "Blaze Warrior": ["Destructive Blaze", "Spammy Arcanist"],
    "Sul'thraze Warrior": ["Bloodsail Deckhand"],
    "STD Dragon Warrior": ["Prescient Slitherdrake"],
    "XL Rock 'n' Roll Warrior": ["Ethereal Oracle"],
    "Igneous Odyn Warrior": ["Blacksmithing Hammer", "Lorekeeper Polkelt", "Odyn, Prime Designate"],
    "Rock 'n' Roll Warrior": ["Bladed Gauntlet", "Charge"],
    "STD Dragon Warrior": ["Brood Keeper", "Stadium Announcer"],
    "Igneous Odyn Warrior": ["Forge of Souls", "Last Stand", "Nightmare Lord Xavius", "Sanitize"],
    "Harold Warrior": ["Envoy of the End"],
    "XL HL Questline Warrior": ["Raid the Docks"],
    "STD Dragon Warrior": ["Darkrider"],
    "Sul'thraze Warrior": ["Sul'thraze"],
    "XL HL Igneous Warrior": ["E.T.C., Band Manager"],
    "Igneous Odyn Warrior": [
      "Aftershocks",
      "All You Can Eat",
      "For Glory!",
      "From the Depths",
      "Igneous Lavagorger",
      "Safety Goggles",
      "Shield Shatter",
      "Sir Finley, Sea Guide",
      "Sphere of Sapience",
      "Unleash the Crocolisks"
    ],
    "XL HL Igneous Warrior": ["Shield Block"],
    "Igneous Warrior": ["The Ceaseless Expanse"]
  ]

  def standard_excludes, do: %{}
  def wild_excludes, do: %{}

  def standard_config, do: add_excludes(@standard_config, standard_excludes())
  def wild_config, do: add_excludes(@wild_config, wild_excludes())

  def standard(card_info) do
    process_config(@standard_config, card_info, :"Other Warrior")
  end

  def wild(card_info) do
    process_config(@wild_config, card_info, :"Other Warrior")
  end
end
