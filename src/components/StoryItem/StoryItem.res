%%raw(`import './StoryItem.css';`)

@react.component
let make = (~story: Models.hitItemModel) => {
  let storyPath = `/item/${story.objectID}`

  <div className="story-item">
    <div className="story-item-header">
      <a href=story.url>
        <span> {story.title->React.string} </span>
        <small>
          <span> {`(`->React.string} </span>
          <span> {story.url->URL.getDomain->React.string} </span>
          <span> {`)`->React.string} </span>
        </small>
      </a>
    </div>
    <div className="story-item-footer">
      <span> {`${story.points->Belt.Int.toString} points`->React.string} </span>
      <span> {story.author->React.string} </span>
      <span> {story.created_at->Date.fromNow->React.string} </span>
      <span>
        <a href={storyPath}>
          {`${story.num_comments->Belt.Int.toString} comments`->React.string}
        </a>
      </span>
    </div>
  </div>
}
