/**
 * @file
 * @license MIT
 */

import { useBackend } from "../../../backend";
import { Window } from "../../../layouts";

interface SimulationCoreJoinPanelData {
  joinable: SimulationCoreJoinable[];
}

interface SimulationCoreJoinable {

}

export const SimulationCoreJoinPanel = (props) => {
  const { act, data } = useBackend<SimulationCoreJoinPanelData>();
  return (

    <Window>
      <Window.Content>
        Test
      </Window.Content>
    </Window>
  );
};
