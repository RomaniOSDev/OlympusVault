//
//  CodexViewModel.swift
//  GateOfOlympus
//
//  Created by Роман Главацкий on 16.07.2025.
//
 import Foundation

final class CodexViewModel: ObservableObject {
    @Published var codexs: [Codex] = [
        Codex(name: "Aegis", type: "Enchanted Armor", origin: "Olympus", rarity: " Legendary", powerLevel: 9, mythicalLore: "The divine shield wielded by Zeus and Athena, adorned with the head of Medusa. It radiates terror and grants invincibility to its bearer."),
        Codex(name: "Trident of Poseidon", type: "Weapon", origin: "Atlantis", rarity: "Legendary", powerLevel: 10, mythicalLore: "Forged in the depths of the sea, Poseidon's trident can stir storms, shatter earth, and control the oceans at will."),
        Codex(name: "Helm of Hades", type: "Cursed Item", origin: "Underworld", rarity: "Mythic", powerLevel: 10, mythicalLore: "A helmet that grants total invisibility. It was worn by Hades and lent to Perseus during his quest to slay Medusa."),
        Codex(name: "Bow of Artemis", type: "Weapon", origin: "Forests of Arcadia", rarity: " Epic", powerLevel: 8, mythicalLore: "This silver bow never misses its target. Gifted by the Titans to Artemis, goddess of the hunt and protector of the wild."),
        Codex(name: "Lyre of Apollo", type: "Divine Tool", origin: "Delphi", rarity: " Rare", powerLevel: 6, mythicalLore: "Crafted by Hermes and gifted to Apollo, this golden lyre brings peace, healing, and divine inspiration through music."),
        Codex(name: "Pandora’s Box", type: "Cursed Item", origin: "Unknown", rarity: " Mythic", powerLevel: 10, mythicalLore: "A sealed container crafted by the gods, it unleashed all evils upon the world—yet left hope inside. Opening it changed mankind forever."),
        Codex(name: "Sword of Perseus", type: "Weapon", origin: "Olympus", rarity: "Epic", powerLevel: 8, mythicalLore: "A celestial blade gifted by the gods. Light as air and sharp as lightning, it was used to defeat Medusa and rescue Andromeda."),
        Codex(name: "Horn of Amalthea (Cornucopia)", type: "Artifact", origin: "Crete", rarity: "Rare", powerLevel: 5, mythicalLore: "The magical horn of the goat that nourished Zeus. It brings endless abundance and provides anything the holder desires."),
        Codex(name: "Apple of Discord", type: "Cursed Item", origin: "Mount Olympus", rarity: " Epic", powerLevel: 7, mythicalLore: "A golden apple inscribed “To the fairest.” Its appearance sparked rivalry among goddesses and led to the Trojan War.")]
}
