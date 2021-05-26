open Json.Decode
open Models

let hitsArrayType = json => {
  switch Js.Json.classify(json) {
  | Js.Json.JSONArray(json) => Js.Array.map(hit => {
      objectID: field("objectID", string, hit),
      title: field("title", string, hit),
      created_at: field("created_at", string, hit),
      url: field("url", string, hit),
      author: field("author", string, hit),
      points: field("points", int, hit),
      num_comments: field("num_comments", int, hit),
    }, json)
  | _ => []
  }
}

let hitsData = (data): hitsModel => {
  {
    nbHits: field("nbHits", int, data),
    page: field("page", int, data),
    nbPages: field("page", int, data),
    hitsPerPage: field("hitsPerPage", int, data),
    hits: field("hits", hitsArrayType, data),
  }
}

let rec storyChildArrayType = (json) => {
  switch Js.Json.classify(json) {
  | Js.Json.JSONArray(json) => Js.Array.map(child => {
      {
        id: field("id", int, child),
        created_at: field("created_at", string, child),
        author: optional(field("author", string), child),
        text: optional(field("text", string), child),
        children: field("children", storyChildArrayType, child),
      }
    }, json)
  | _ => []
  }
}

let storyData = (data): storyItemModel => {
  {
    id: field("id", int, data),
    author: field("author", string, data),
    created_at: field("created_at", string, data),
    title: field("title", string, data),
    points: field("points", int, data),
    url: field("url", string, data),
    children: field("children", storyChildArrayType, data),
  }
}
