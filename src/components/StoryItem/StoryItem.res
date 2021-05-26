%%raw(`import './StoryItem.css';`)

@react.component
let make = (
  ~id: string,
  ~title: string,
  ~url: string,
  ~points: int,
  ~author: string,
  ~createdAt: string,
  ~numberOfComments: int,
) => {
  let storyPath = `/item/${id}`
  let comments = switch numberOfComments {
  | 0 => <> </>
  | count =>
    <a href={storyPath} className="story-item-footer-comments">
      {`${count->Belt.Int.toString} comments`->React.string}
    </a>
  | _ => <> </>
  }
  <div className="story-item">
    <a href=url className="story-item-header">
      <span className="story-item-header-title"> {title->React.string} </span>
      <small className="story-item-header-domain">
        <span> {`(`->React.string} </span>
        <span> {url->URL.getDomain->React.string} </span>
        <span> {`)`->React.string} </span>
      </small>
    </a>
    <div className="story-item-footer">
      <span> {`${points->Belt.Int.toString} points`->React.string} </span>
      <span> {author->React.string} </span>
      <span> {createdAt->Date.fromNow->React.string} </span>
      {comments}
    </div>
  </div>
}
