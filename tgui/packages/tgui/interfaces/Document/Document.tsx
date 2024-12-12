/**
 * @file
 * @license MIT
 */

interface DocumentData {
  readonly metadata: {
    readonly serializedHash: string | null;
  };
}

interface DocumentProps {
  readonly data: DocumentData;
}

export const Document = (props: DocumentProps, context) => {
  return (
    <div>
      test
    </div>
  )
};
