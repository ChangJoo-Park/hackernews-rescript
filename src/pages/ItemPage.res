%%raw(`import './ItemPage.css';`)

open Js.Promise
@react.component
let make = (~id: string) => {
  let (story, setStory, fetchStory) = Composable.useStory()

  React.useEffect0(() => {
    let _ = fetchStory(id)->then_(item => setStory(_ => Some(item))->resolve, _)
    None
  })

  let renderStory = switch story {
  | Some(story) =>
    <div>
      <StoryItem
        key=Belt.Int.toString(story.id)
        id=Belt.Int.toString(story.id)
        title=story.title
        url=story.url
        points=story.points
        author=story.author
        createdAt=story.created_at
        numberOfComments=0
      />
      <div className="comment-list-wrap"> <CommentList commentList={story.children} /> </div>
    </div>
  | None => <div />
  }
  <div className="story-detail"> {renderStory} </div>
}
