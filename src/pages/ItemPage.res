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
  | Some(story) => {
      <div>
        <div className="story-item">
          <a href=story.url className="story-item-header">
            <span className="story-item-header-title"> {story.title->React.string} </span>
            <small className="story-item-header-domain">
              <span> {`(`->React.string} </span>
              <span> {story.url->URL.getDomain->React.string} </span>
              <span> {`)`->React.string} </span>
            </small>
          </a>
          <div className="story-item-footer">
            <span> {`${story.points->Belt.Int.toString} points`->React.string} </span>
            <span> {story.author->React.string} </span>
            <span> {story.created_at->Date.fromNow->React.string} </span>
          </div>
        </div>
        <div className="comment-list-wrap">
          <CommentList commentList={story.children} />
        </div>

      </div>
    }
  | None => <div />
  }
  <div className="story-detail"> {renderStory} </div>
}
