# HTML Generator (EDSL)

Embedded Html Language in Haskell inspired from book [Learn Haskell by building a blog generator](https://lhbg-book.link/).

## Run

If you don't have Haskell, [Setup Haskell](https://www.haskell.org/downloads/) first  and then run the command: `runghc [ANY_EXAMPLE_FILE]`

## Examples

Here's what it looks like:

```haskell
import Html.Utils
import Html.Core

main :: IO()
main = writeFile "html-generator.html" (
    render( boilerplate_
        "HTML Generator (EDSL in Haskell)"
        [
            h1_ "HTML Generator (EDSL in Haskell)",
            p_ "Embedded Html Language in Haskell inspired from book: ",
            a_ "Learn Haskell by building a blog generator" [attribute_ "href" "https://lhbg-book.link/"]
        ]
        )
    )
```

More examples can be found [here](./Examples/).
