%%raw(`import './App.css';`)

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let page = switch url.path {
  | list{} => <HomePage />
  | list{"item", id} => <ItemPage id />
  | _ => <NotFoundPage />
  }
  <div className="App">
    <Nav />
    {page}
  </div>
}
