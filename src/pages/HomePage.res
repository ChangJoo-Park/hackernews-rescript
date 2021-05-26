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

  <div className="stories"> {stories} </div>
}
