//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

import { DocumentData } from "./types";

type DocumentRenderProps = {
  // url to load stuff from. should be `${root}/whatever`, where 'root'
  // is this variable.
  // * HTTPS required.
  // * If this is missing, overlays / underlays / pictures will not load.
  filestoreWebroot: string | null;
  // document to render
  document: DocumentData;
}

export const DocumentRender = (props: DocumentRenderProps) => {

}
