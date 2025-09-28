//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

export type DocumentHash = string;
export type DocumentId = string;

export type DocumentData = DocumentLayer & {
  // hash of underlay to fetch
  underlays: null | DocumentHash[];
  // hash of overlays to put ontop
  overlays: null | DocumentHash[];
}

export type DocumentSerialized = {
  layer: DocumentLayer;
}

/**
 * * Serializable;
 */
export type DocumentLayer = {
  base: string;
  baseType: DocumentBaseType;
  fragments?: DocumentFragment[] | null | undefined;
}

export type DocumentOverlay = {
  layer: DocumentLayer;
  // from top left
  transformX: number;
  // from top left
  transformY: number;
  // multiplier
  scale: number;
  // degrees clockwise
  rotate: number;
}

/**
 * Base types. Bases of layers must be string data.
 * * Serializable; uses short variable names.
 */
export enum DocumentBaseType {
  HTML = "html",
  MARKDOWN = "md",
  BBCODE = "bb",
}

/**
 * * Serializable; uses short variable names.
 */
export type DocumentFragment =
  DocumentFragment_HTML |
  DocumentFragment_Markdown |
  DocumentFragment_BBCode;

type DocumentFragmentBase = {
  type: string;
  // from top left
  tx: number;
  // from top left
  ty: number;
  // degrees clockwise
  ta: number;
  // as multiplier
  ts: number;
}

/**
 * * DO NOT ALLOW PLAYER INPUT
 */
export type DocumentFragment_HTML = DocumentFragmentBase & {
  type: "html";
  raw: string;
}

export type DocumentFragment_BBCode = DocumentFragmentBase & {
  type: "bb";
  raw: string;
}

export type DocumentFragment_Markdown = DocumentFragmentBase & {
  type: "md";
  raw: string;
}

/**
 * Direct hash-ref to a picture. The browser will not query the server,
 * the URL will automatically be generated if a `filestore_webroot` is
 * provided to the renderer.
 * * DO NOT ALLOW PLAYER INPUT
 */
export type DocumentFragment_Picture = DocumentFragmentBase & {
  type: "pic";
  hash: string;
}
