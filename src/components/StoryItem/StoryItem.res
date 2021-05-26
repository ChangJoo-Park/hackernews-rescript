%%raw(`import './StoryItem.css';`)

@react.component
let make = (~story: Models.hitItemModel) => {
  let storyPath = `/item/${story.objectID}`

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
      <a href={storyPath} className="story-item-footer-comments"> {`${story.num_comments->Belt.Int.toString} comments`->React.string} </a>
    </div>
  </div>
}
