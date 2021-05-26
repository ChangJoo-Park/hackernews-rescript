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

  <div> {`홈페이지입니다`->React.string} <div className="stories"> {stories} </div> </div>
}
