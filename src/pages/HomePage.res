%%raw(`import './HomePage.css';`)

@react.component
let make = () => {
  let (stories, getStories) = Composable.useStories()

  React.useEffect0(() => {
    let _ = getStories()
    None
  })

  let renderStories =
    stories
    ->Belt.Array.map(story => {
      <StoryItem
        key=story.objectID
        id=story.objectID
        title=story.title
        url=story.url
        points=story.points
        author=story.author
        createdAt=story.created_at
        numberOfComments=story.num_comments
      />
    })
    ->React.array
  <>
    <div className="stories"> {renderStories} </div>
    <div>
      {"This website use Algolia Search's API "->React.string}
      {"please see "->React.string}
      <a href="https://hn.algolia.com/api"> {"this doc"->React.string} </a>
    </div>
  </>
}
