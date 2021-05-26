%%raw(`import './CommentList.css';`)

@react.component
let make = (~commentList: array<Models.storyChildModel>) => {
  let rec renderCommentList = (commentList: array<Models.storyChildModel>) => {
    commentList -> Belt.Array.map((comment: Models.storyChildModel) => {
    let author = switch comment.author{
    | Some(author) => author
    | _ => ""
    }
    let text = switch comment.text{
    | Some(text) => text
    | _ => ""
    }

    <div
      className=`comment comment-${comment.id->Belt.Int.toString}`
      key={comment.id->Belt.Int.toString}
    >
      <div>{author->React.string}</div>
      <div>{comment.created_at->Date.fromNow->React.string}</div>
      <div
          dangerouslySetInnerHTML={"__html": text}
        />

      {renderCommentList(comment.children)}
    </div>
    }
    )
  }->React.array
  <div>
    {renderCommentList(commentList)}
  </div>
}
