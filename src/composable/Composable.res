let useStories = () => {
  let (stories, setStories) = React.useState(() => [])

  let getStories = () =>
    Fetch.fetch("https://hn.algolia.com/api/v1/search?tags=front_page")
    ->Js.Promise.then_(Fetch.Response.json, _)
    ->Js.Promise.then_(obj => obj->Decoder.hitsData->Js.Promise.resolve, _)
    ->Js.Promise.then_((hits: Models.hitsModel) =>
      {
        setStories(_ => hits.hits)
        None
      }->Js.Promise.resolve
    , _)

  (stories, getStories)
}

let useStory = () => {
  let (story, setStory) = React.useState(() => None)

  let fetchStory = id =>
    Fetch.fetch(`https://hn.algolia.com/api/v1/items/${id}`)
    ->Js.Promise.then_(Fetch.Response.json, _)
    ->Js.Promise.then_(obj => obj->Decoder.storyData->Js.Promise.resolve, _)

  (story, setStory, fetchStory)
}
