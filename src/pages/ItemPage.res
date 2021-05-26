open Js.Promise
@react.component
let make = (~id: string) => {
  let (story, setStory, fetchStory) = Composable.useStory()

  React.useEffect0(() => {
    let _ = fetchStory(id)->then_(item => setStory(_ => Some(item))->resolve, _)
    None
  })

  let renderStory = switch story {
  | Some(story) => <div>
    <div>{story.id->Belt.Int.toString->React.string}</div>
    <div>{story.title->React.string}</div>
    <div>{story.author->React.string}</div>
    <div>{story.url->React.string}</div>
    <CommentList commentList={story.children} />
    </div>
  | None => <div />
  }
  <div> {"Item Page"->React.string}
   {renderStory}
   </div>
}
