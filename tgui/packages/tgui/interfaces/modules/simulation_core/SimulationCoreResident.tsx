/**
 * @file
 * @license MIT
 */

import { useBackend } from "../../../backend";
import { Window } from "../../../layouts";

interface SimulationCoreResidentData {

}

export const SimulationCoreResident = (props) => {
  const { act, data } = useBackend<SimulationCoreResidentData>();
  return (
    <Window>
      <Window.Content>
        Test
      </Window.Content>
    </Window>
  );
};
