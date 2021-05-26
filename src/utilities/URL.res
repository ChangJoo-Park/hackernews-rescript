let getDomain = (url: string) => {
  let domain = ref(url)
  domain.contents = switch Js.String.includes("://", domain.contents) {
  | true => Js.String.split("/", domain.contents)[2]
  | false => Js.String.split("/", domain.contents)[0]
  }
  Js.String.split(":", domain.contents)[0]
}
