%%raw(`import './Nav.css';`)

@react.component
let make = () => {
  <div className="nav">
    <a className="brand" href="/">
      <img className="logo" src="https://rescript-lang.org/static/nav-logo-full@2x.png" />
      <div> {" React HackerNews"->React.string} </div>
    </a>
  </div>
}
