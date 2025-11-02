/**
 * @file
 * @license MIT
 */

import { useBackend } from "../../../backend";
import { Window } from "../../../layouts";

interface SimulationCoreData {
  residents: SimulationCoreResidentStatus[];
}

interface SimulationCoreResidentStatus {

}

enum SimulationCoreHypervisorAuthorization {
  World = (1 << 0),
  Puppet = (1 << 1),
}

export const SimulationCore = (props) => {
  const { act, data } = useBackend<SimulationCoreData>();
  return (
    <Window>
      <Window.Content>
        Test
      </Window.Content>
    </Window>
  );
};
