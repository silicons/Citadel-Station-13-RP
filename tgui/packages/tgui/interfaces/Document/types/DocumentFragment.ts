export type DocumentFragmentRepr =
  DocumentFragment_Markdown |
  DocumentFragment_HTML |
  DocumentFragment_Polyline;

type DocumentFragmentBase = {
  key: string;
}

type DocumentFragment_Markdown = DocumentFragmentBase & {
  key: "markdown"
  content: string
  pos_x: number
  pos_y: number
  angle: number | null
  color: string | null
}

type DocumentFragment_HTML = DocumentFragmentBase & {
  key: "html"
  content: string
  pos_x: number
  pos_y: number
}

type DocumentFragment_Polyline = DocumentFragmentBase & {
  style: "solid";
  color: string;
  vertices: string;
}
