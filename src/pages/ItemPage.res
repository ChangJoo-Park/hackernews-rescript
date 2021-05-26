open Js.Promise
@react.component
let make = (~id: string) => {
  let (story, setStory, fetchStory) = Composable.useStory()

  React.useEffect0(() => {
    let _ = fetchStory(id)->then_(item => setStory(_ => Some(item))->resolve, _)
    None
  })

  let renderStory = switch story {
  | Some(story) => <div> {story.id->Belt.Int.toString->React.string} </div>
  | None => <div />
  }
  <div> {"Item Page"->React.string}
   {renderStory}
   </div>
}
