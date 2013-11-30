// tdlive aw'sum's awesome weapon checker

// copyright (c) 2013 tdlive aw'sum. some rights reserved
// licensed under the gnu gpl v2, available at
// http://gnu.org/licenses

// thanks to the old gmod wiki for their SWEP template

if SERVER then // This is where the init.lua stuff goes.
 
	//This makes sure clients download the file
	AddCSLuaFile ("ttt_weaponchecker.lua")
 
	//How heavy the SWep is
	SWEP.Weight = 5
 
	//Allow automatic switching to/from this weapon when weapons are picked up
	SWEP.AutoSwitchTo = false
	SWEP.AutoSwitchFrom = false
	
elseif CLIENT then // This is where the cl_init.lua stuff goes
 
	//The name of the SWep, as appears in the weapons tab in the spawn menu(Q Menu)
	SWEP.PrintName = "Weapon Checker"
 
	//Sets the position of the weapon in the switching menu 
	//(appears when you use the scroll wheel or keys 1-6 by default)
	SWEP.Slot = 8
	SWEP.SlotPos = 1
 
	//Sets drawing the ammuntion levels for this weapon
	SWEP.DrawAmmo = false
	
end

SWEP.Author = "tdlive aw'sum"
SWEP.Instructions = "Left mouse checks weapons."

//TTT
SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_EQUIP2
SWEP.CanBuy = { ROLE_DETECTIVE }
SWEP.LimitedStock = false
SWEP.AllowDrop = false
SWEP.IsSilent = false
SWEP.AutoSpawnable = false

   SWEP.EquipMenuData = {
      type = "item_weapon",
      desc = "Left-click checks weapons."
   };

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= false

SWEP.ViewModel			= "models/weapons/v_pistol.mdl"
SWEP.WorldModel			= "models/weapons/w_pistol.mdl"

SWEP.Primary.Automatic			= false
SWEP.Primary.Delay				= 2

SWEP.Category = "TTT Weapons" //compatibility with sandbox

function SWEP:Deploy()
return true
end
 
function SWEP:Holster()
return true
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	check_weapons = { }
	check_weapons[1] = "ttt_weaponchecker"
	check_weapons[2] = "weapon_crowbar"
	
	check_weapons_lang = { }
	check_weapons[1] = "Weapon Checker"
	check_weapons[2] = "Crowbar"
	
	local ply = self.Owner
	
	if ! ply:GetEyeTrace().Entity:IsValid() then
		return
	end
	
	c_ply = ply:GetEyeTrace().Entity
	
	local i = 0;
	
	ply:PrintMessage(HUD_PRINTTALK, c_ply:Nick() .. " has:")
	
	if c_ply:HasWeapon("weapon_ttt_c4") then ply:PrintMessage(HUD_PRINTTALK, "C4"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_flaregun") then ply:PrintMessage(HUD_PRINTTALK, "Flare Gun"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_glock") then ply:PrintMessage(HUD_PRINTTALK, "Glock"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_knife") then ply:PrintMessage(HUD_PRINTTALK, "Knife"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_m16") then ply:PrintMessage(HUD_PRINTTALK, "M16"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_sipistol") then ply:PrintMessage(HUD_PRINTTALK, "Silenced Pistol"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_smokegrenade") then ply:PrintMessage(HUD_PRINTTALK, "Smoke Grenade"); i=1; end
	if c_ply:HasWeapon("weapon_ttt_teleport") then ply:PrintMessage(HUD_PRINTTALK, "Teleporter"); i=1; end
	if c_ply:HasWeapon("weapon_zm_mac10") then ply:PrintMessage(HUD_PRINTTALK, "MAC10"); i=1; end
	if c_ply:HasWeapon("weapon_zm_molotov") then ply:PrintMessage(HUD_PRINTTALK, "Molotov Cocktail"); i=1; end
	if c_ply:HasWeapon("weapon_zm_revolver") then ply:PrintMessage(HUD_PRINTTALK, "Revolver"); i=1; end
	if c_ply:HasWeapon("weapon_zm_rifle") then ply:PrintMessage(HUD_PRINTTALK, "Rifle"); i=1; end
	if c_ply:HasWeapon("weapon_zm_shotgun") then ply:PrintMessage(HUD_PRINTTALK, "Shotgun"); i=1; end
	if c_ply:HasWeapon("weapon_zm_sledge") then ply:PrintMessage(HUD_PRINTTALK, "Sledgehammer"); i=1; end
	
	if SERVER then self:Remove() end
	
end

function SWEP:SecondaryAttack()
	local ply = self.Owner
	
	ply:PrintMessage(HUD_PRINTTALK, "Hint! Use left-click to scan players.")
	
	return
end

function SWEP:Think()
end

function SWEP:CheckWeapons(ply)
end
