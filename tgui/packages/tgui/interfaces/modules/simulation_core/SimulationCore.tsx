/**
 * @file
 * @license MIT
 */

import { useBackend } from "../../../backend";
import { Window } from "../../../layouts";

interface SimulationCoreData {

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
