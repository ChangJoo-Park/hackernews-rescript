type hitItemModel = {
  objectID: string,
  title: string,
  created_at: string,
  url: string,
  author: string,
  points: int,
  num_comments: int,
}

type hitsModel = {
  nbHits: int,
  page: int,
  nbPages: int,
  hitsPerPage: int,
  hits: array<hitItemModel>,
}

type hitsArrayModel = array<hitItemModel>

type rec storyChildModel = {
  id: int,
  created_at: string,
  author: option<string>,
  text: option<string>,
  children: array<storyChildModel>
}
type storyItemModel = {
  id: int,
  author: string,
  created_at: string,
  title: string,
  points: int,
  url: string,
  children: array<storyChildModel>
}
