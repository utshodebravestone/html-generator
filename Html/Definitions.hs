-- * Contains type definitions

module Html.Definitions where

newtype Document = Document [Element]

data Element =
    Element {
        kind :: ElementKind,
        text :: String,
        attributes :: [Attribute],
        children :: [Element]
    }

data ElementKind =
    Html |
    Head |
    Title |
    Body |
    H1 |
    H2 |
    H3 |
    H4 |
    H5 |
    H6 |
    P |
    Small |
    B |
    I |
    A

data Attribute =
    Attribute {
        key :: String,
        value :: String
    }
