%%raw(`import './HomePage.css';`)

@react.component
let make = () => {
  let (stories, getStories) = Composable.useStories()

  React.useEffect0(() => {
    let _ = getStories()
    None
  })
  let stories = {
    stories->Belt.Array.map(story => <StoryItem key=story.objectID story />)->React.array
  }
  <>
    <div className="stories">
      {stories}
    </div>
    <div>
      {"This website use Algolia Search's API "->React.string}
      {"please see "->React.string}
      <a href="https://hn.algolia.com/api">{"this doc"->React.string}</a>
    </div>
  </>
}
