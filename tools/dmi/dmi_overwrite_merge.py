import dmi
import os
import sys
from dmi import merge_driver

# Merge one DMI into the other
# Overwrites all conflicting states
# Arguments are files.
def dmi_overwrite_merge(frompath, topath):
    # grab both sets of dmis
    try:
        src = dmi.Dmi.from_file(frompath)
    except Exception:
        print("Skipping " + frompath + " --> " + topath + ": Could not parse origin.")
        return
    try:
        dest = dmi.Dmi.from_file(topath)
    except Exception:
        print("Skipping " + frompath + " --> " + topath + ": Could not parse destination.")
        return
    width = src.width
    height = src.height
    if width != dest.width:
        print("Skipping " + frompath + " --> " + topath + ": Widths don't match.")
        return
    if height != dest.height:
        print("Skipping " + frompath + " --> " + topath + ": Heights don't match.")
        return
    final = dmi.Dmi(width, height)
    changed = False
    overwrote = 0
    appended = 0
    built = dest.states.copy()
    for state in src.states:
        name = state.name
        movement = state.movement
        found = False
        for index in range(0, len(built)):
            other = built[index]
            if (other.name != name) or (other.movement != movement):
                continue
            if not merge_driver.states_equal(state, other):
                built[index] = state
                changed = True
                overwrote += 1
            found = True
            break
        if not found:
            built.append(state)
            changed = True
            appended += 1
    if not changed:
        print("No change: " + frompath + " == " + topath)
        return
    print("Writing " + frompath + " --> " + topath + " with " + str(overwrote) + " states overwritten and " + str(appended) + " states appended.")
    final.states = built
    os.remove(topath)
    final.to_file(topath)

# Tool to overwrite another icon folder into the first one
def icon_folder_walk_replace(frompath, topath):
    recursive_replace_helper(frompath, topath, "")

# recursive helper
def recursive_replace_helper(frompath, topath, sofar):
    for path in os.listdir(frompath + sofar):
        rel = frompath + sofar + "/" + path
        if os.path.isfile(rel):
            # handle root files
            if os.path.splitext(path)[1] != ".dmi":
                continue
            elif os.path.exists(topath + sofar + "/" + path):
                # print(rel, topath + sofar + "/" + path)
                dmi_overwrite_merge(rel, topath + sofar + "/" + path)
        elif os.path.isdir(rel):
            recursive_replace_helper(frompath, topath, sofar + "/" + path)
