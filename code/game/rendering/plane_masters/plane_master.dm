/atom/movable/screen/plane_master
	icon = null
	icon_state = null
	screen_loc = "CENTER"
	plane = -100 //Dodge just in case someone instantiates one of these accidentally, don't end up on 0 with plane_master
	appearance_flags = PLANE_MASTER

	/// unique id
	var/id
	/// only on clients
	///
	/// * this means only client plane holders will make them
	var/client_global = FALSE
	/// special - managed, like parallax holders
	///
	/// * this means no plane holder will make them
	var/special_managed = FALSE
	/// defaults to invisible / hidden
	///
	/// * this will stop the plane from appearing, but it is still rendering.
	var/default_invisible = FALSE
	/// default alpha
	///
	/// * this is our visible alpha
	var/default_alpha = 255
	/// is occlusion on?
	///
	/// * fake AO just applies a filter, it's kind of ugly but players want it.
	var/tmp/fake_occlusion_enabled = FALSE
	/// only made if asked for
	///
	/// * this is basically something that is only applied to a perspective / client if there's a need
	/// * for example, special HUDs that require weird plane rendering will do this
	/// * they can include dependencies
	var/extension_plane = FALSE
	#warn impl
	/// this is a shared plane; reject any edits like ambient occlusion
	var/shared_plane = FALSE

/atom/movable/screen/plane_master/proc/set_fake_ambient_occlusion(enabled)
	if(shared_plane)
		return
	if(enabled && !fake_occlusion_enabled)
		fake_occlusion_enabled = TRUE
		filters += AMBIENT_OCCLUSION
	else if(fake_occlusion_enabled)
		fake_occlusion_enabled = FALSE
		filters -= AMBIENT_OCCLUSION

//* KEEP THESE SORTED

/atom/movable/screen/plane_master/space
	id = "world-space"
	plane = SPACE_PLANE
	alpha = 255
	mouse_opacity = MOUSE_OPACITY_ICON
	client_global = TRUE
	special_managed = TRUE

/atom/movable/screen/plane_master/parallax
	id = "parallax-main"
	plane = PARALLAX_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	blend_mode = BLEND_MULTIPLY
	alpha = 255
	client_global = TRUE
	special_managed = TRUE

/atom/movable/screen/plane_master/turfs
	id = "world-turfs"
	plane = TURF_PLANE
	render_target = TURF_PLANE_RENDER_TARGET

/atom/movable/screen/plane_master/objs
	id = "world-objs"
	plane = OBJ_PLANE
	render_target = OBJ_PLANE_RENDER_TARGET

/atom/movable/screen/plane_master/mobs
	id = "world-mobs"
	plane = MOB_PLANE
	render_target = MOB_PLANE_RENDER_TARGET

//Cloaked atoms are visible to ghosts (or for other reasons?)
/atom/movable/screen/plane_master/cloaked
	id = "legacy-cloaked"
	plane = CLOAKED_PLANE
	default_alpha = 80
	color = "#0000FF"

// todo: remove
/atom/movable/screen/plane_master/above
	id = "legacy-above"
	plane = ABOVE_PLANE

/atom/movable/screen/plane_master/byond
	id = "byond"
	plane = BYOND_PLANE
	render_target = BYOND_RENDER_TARGET
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/byond/Initialize(mapload)
	. = ..()
	add_filter("occlusion", 1, alpha_mask_filter(render_source = BYOND_OCCLUSION_RENDER_TARGET, flags = MASK_INVERSE))

/atom/movable/screen/plane_master/byond_occlusion
	id = "byond-occlusion"
	plane = BYOND_OCCLUSION_PLANE
	render_target = BYOND_OCCLUSION_RENDER_TARGET
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/weather
	id = "world-weather"
	plane = WEATHER_PLANE

/**
 * Handles emissive overlays and emissive blockers.
 */
/atom/movable/screen/plane_master/emissive
	id = "lighting-emissive"
	name = "emissive plane master"
	plane = EMISSIVE_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_target = EMISSIVE_RENDER_TARGET
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	alpha = 255

/atom/movable/screen/plane_master/emissive/Initialize(mapload)
	. = ..()
	add_filter("em_block_masking", 1, color_matrix_filter(GLOB.em_mask_matrix))

/atom/movable/screen/plane_master/lightmask
	id = "render-lightmask"
	plane = LIGHTMASK_PLANE
	render_target = LIGHTMASK_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	// alpha changes color matrix lists's aa value
	// don't blame me, i didn't make the rules, god damnit byond.
	default_alpha = 0
	// convert all color to alpha, with a boost
	color = list(
		0, 0, 0, 0.75,
		0, 0, 0, 0.75,
		0, 0, 0, 0.75,
		0, 0, 0, 0,
		1, 1, 1, 0
	)

/atom/movable/screen/plane_master/lighting
	id = "lighting"
	plane = LIGHTING_PLANE
	blend_mode = BLEND_MULTIPLY
	render_target = LIGHTING_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	alpha = 255

/*!
 * This system works by exploiting BYONDs color matrix filter to use layers to handle emissive blockers.
 *
 * Emissive overlays are pasted with an atom color that converts them to be entirely some specific color.
 * Emissive blockers are pasted with an atom color that converts them to be entirely some different color.
 * Emissive overlays and emissive blockers are put onto the same plane.
 * The layers for the emissive overlays and emissive blockers cause them to mask eachother similar to normal BYOND objects.
 * A color matrix filter is applied to the emissive plane to mask out anything that isn't whatever the emissive color is.
 * This is then used to alpha mask the lighting plane.
 */

/atom/movable/screen/plane_master/lighting/Initialize(mapload)
	. = ..()
	add_filter("emissives", 1, alpha_mask_filter(render_source = EMISSIVE_RENDER_TARGET, flags = MASK_INVERSE))

/**
 * darkvision plate: gathers everything we can see, colors it, etc
 * the actual drawing and occlusion effects are done on the darkvision plane, which is BLEND_ADD.
 *
 * todo: split into turfs/objs/mobs plane? and add a FOV plane? vision.partial_fov for darksight-only fov?
 */
/atom/movable/screen/plane_master/darkvision
	plane = DARKVISION_PLANE
	blend_mode = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	render_target = DARKVISION_RENDER_TARGET

/atom/movable/screen/plane_master/darkvision/Initialize(mapload)
	. = ..()
	add_filter("lightmask", 1, alpha_mask_filter(render_source = LIGHTMASK_RENDER_TARGET, flags = MASK_INVERSE))
	add_filter("occlusion", 2, alpha_mask_filter(render_source = DARKVISION_OCCLUSION_RENDER_TARGET, flags = MASK_INVERSE))
	add_filter("fov", 3, alpha_mask_filter(render_source = FOV_OCCLUSION_RENDER_TARGET, flags = MASK_INVERSE))


/**
 * *sigh* this sucks but whatever
 */
/atom/movable/screen/plane_master/darkvision_occlusion
	id = "darkvision-occlusion"
	plane = DARKVISION_OCCLUSION_PLANE
	render_target = DARKVISION_OCCLUSION_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
	// alpha changes color matrix lists's aa value
	// don't blame me, i didn't make the rules, god damnit byond.
	default_alpha = 0
	// convert all color to alpha, with a massive boost
	color = list(
		0, 0, 0, -0.5,
		0, 0, 0, -0.5,
		0, 0, 0, -0.5,
		0, 0, 0, 0,
		0, 0, 0, 1,
	)

/atom/movable/screen/plane_master/darkvision_occlusion/Initialize(mapload)
	. = ..()
	add_filter("extend_shadow1", 1, drop_shadow_filter(x = 0, y = 0, size = 2, offset = 0, color = "#999999"))
	add_filter("extend_shadow2", 1, drop_shadow_filter(x = 0, y = 0, size = 4, offset = 0, color = "#99999944"))
	add_filter("extend_shadow3", 1, drop_shadow_filter(x = 0, y = 0, size = 6, offset = 0, color = "#99999922"))
	add_filter("smoothing", 1, gauss_blur_filter(size = 4))

/atom/movable/screen/plane_master/fov_occlusion
	id = "darkvision-fov"
	plane = FOV_OCCLUSION_PLANE
	render_target = FOV_OCCLUSION_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/lightless
	id = "lightless"
	plane = LIGHTLESS_PLANE
	render_target = LIGHTLESS_RENDER_TARGET
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/lightless/Initialize(mapload)
	. = ..()
	add_filter("mask", 1, alpha_mask_filter(render_source = LIGHTMASK_RENDER_TARGET, flags = MASK_INVERSE))

/atom/movable/screen/plane_master/above_lighting
	id = "above_lighting"
	plane = ABOVE_LIGHTING_PLANE

/atom/movable/screen/plane_master/sonar
	id = "sonar"
	plane = SONAR_PLANE
	default_invisible = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/observer
	id = "observer"
	plane = OBSERVER_PLANE
	default_invisible = TRUE

/atom/movable/screen/plane_master/augmented
	id = "augmented"
	plane = AUGMENTED_PLANE
	default_invisible = TRUE

/atom/movable/screen/plane_master/verticality
	id = "verticality"
	plane = VERTICALITY_PLANE
	alpha = 0
	default_invisible = TRUE
	client_global = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/fullscreen
	id = "hud-fullscreen"
	plane = FULLSCREEN_PLANE
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/hud
	id = "hud-main"
	plane = HUD_PLANE
	appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR

/atom/movable/screen/plane_master/inventory
	id = "hud-inventory"
	plane = INVENTORY_PLANE

/atom/movable/screen/plane_master/above_hud
	id = "hud-above"
	plane = ABOVE_HUD_PLANE
