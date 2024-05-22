import { BooleanLike } from "common/types";
import { Box, Section, Stack } from "tgui/components"

export interface DynamicConfigSchema {
  options: DynamicConfigOptions;
  layout: DynamicConfigLayout;
}

type DynamicConfigEntryId = string;

type DynamicConfigOptions = Record<DynamicConfigEntryId, DynamicConfigEntrySchema>;

type DynamicConfigLayout = DynamicConfigLayoutFragment[];

type DynamicConfigLayoutFragment =
  DynamicConfigEntryId | // render a single entry
  Array<DynamicConfigEntryId>; // render a split <Stack> of entries

type DynamicConfigEntrySchema =
  DynamicConfigEntryBase |
  DynamicConfigEntryDropdown |
  DynamicConfigEntryNumber |
  DynamicConfigEntryString |
  DynamicConfigEntryToggle;

interface DynamicConfigEntryBase {
  name: string;
  desc: string;
  default: any;
  type: string;
}

interface DynamicConfigEntryString extends DynamicConfigEntryBase {
  type: "string";
  default: string;
  max: number; // max length
}

interface DynamicConfigEntryNumber extends DynamicConfigEntryBase {
  type: "number";
  min: number;
  max: number;
  round: number; // round to nearest
  default: number;
}

interface DynamicConfigEntryToggle extends DynamicConfigEntryBase {
  type: "toggle";
  default: BooleanLike;
}

interface DynamicConfigEntryDropdown extends DynamicConfigEntryBase {
  type: "dropdown";
  default: string;
  choices: Record<string, string | null | undefined>;
}

interface DyanmicConfigProps {
  schema: DynamicConfigSchema;
  values: Record<DynamicConfigEntryId, any>;
  onChange: (key: DynamicConfigEntryId, value: any) => void;
  // should we fill all available space up/down
  fill?: BooleanLike;
  // buttons rendered at the bottom
  buttons?: InfernoNode[];
}

export const DynamicConfig = (props: DyanmicConfigProps) => {
  return (
    <Section fill={props.fill}>
      <Stack fill vertical>
        <Stack.Item grow={1}>
          <Stack fill vertical overflowY="auto">
            {props.schema.layout.map((layoutFragment) => {
              if(typeof layoutFragment === "string") {
                return (
                  <Stack.Item key={layoutFragment}>
                    <DynamicConfigEntry schema={props.schema.options[layoutFragment]}
                      value={props.values[layoutFragment]}
                      onChange={props.onChange}>
                    </DynamicConfigEntry>
                  </Stack.Item>
                )
              }
              else if(layoutFragment instanceof Array) {
                  return (
                    <Stack.Item key={layoutFragment.join(".")}>
                      <Stack fill>
                        {layoutFragment.map((id) => (
                          <Stack.Item key={id}>
                            <DynamicConfigEntry
                              schema={props.schema.options[id]}
                              value={props.values[id]}
                              onChange={props.onChange}>
                              </DynamicConfigEntry>
                          </Stack.Item>
                        ))}
                      </Stack>
                    </Stack.Item>
                  )
              }
              else {
                return (
                  <Stack.Item key={layoutFragment}>error: contact coders</Stack.Item>
                )
              }
            })}
          </Stack>
        </Stack.Item>
        {props.buttons?.length && (
          <Stack.Item>
            <Stack>
              {props.buttons.map((node) => (
                <Stack.Item grow={1}>
                  {node}
                </Stack.Item>
              ))}
            </Stack>
          </Stack.Item>
        )}
      </Stack>
    </Section>
  )
}

interface DynamicConfigEntryProps {
  schema: DynamicConfigEntrySchema;
  value: any;
  onChange: (id: string, value: any) => void;
}

const DynamicConfigEntry = (props: DynamicConfigEntryProps) => {
  return (
    <Box>
      test
    </Box>
  )
}
