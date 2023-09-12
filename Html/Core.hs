-- * Contains core functions

module Html.Core (
    -- * Elements
    document_,
    html_,
    head_,
    title_,
    body_,
    h1_,
    h2_,
    h3_,
    h4_,
    h5_,
    h6_,
    p_,
    small_,
    b_,
    i_,
    a_,

    -- * Helpers
    attribute_,

    -- * Renderer
    render,
) where

import Html.Definitions

-- * Public Render Methods

render :: Document -> String
render document =
    case document of
        Document elements ->
            "<!DOCTYPE html>" <> (renderElements elements)

-- * Private Render Methods

renderElements :: [Element] -> String
renderElements = concat . (map renderElement)

renderElement :: Element -> String
renderElement currentElement =
    case kind currentElement of
        Html ->
            "<html>"
            <> (concat (map renderElement (children currentElement))) <>
            "</html>"

        Head ->
            "<head>"
            <> (concat (map renderElement (children currentElement))) <>
            "</head>"

        Title ->
            "<title>" <> text currentElement <>  "</title>"

        Body ->
            "<body>"
            <> (concat (map renderElement (children currentElement))) <>
            "</body>"

        H1 ->
            "<h1>" <> text currentElement <>  "</h1>"

        H2 ->
            "<h2>" <> text currentElement <>  "</h2>"

        H3 ->
            "<h3>" <> text currentElement <>  "</h3>"

        H4 ->
            "<h4>" <> text currentElement <>  "</h4>"

        H5 ->
            "<h5>" <> text currentElement <>  "</h5>"

        H6 ->
            "<h6>" <> text currentElement <>  "</h6>"

        P ->
            "<p>" <> text currentElement <>  "</p>"

        Small ->
            "<small>" <> text currentElement <>  "</small>"

        B ->
            "<b>" <> text currentElement <>  "</b>"

        I ->
            "<i>" <> text currentElement <>  "</i>"

        A ->
            "<a " <>renderAttributes (attributes currentElement) <> ">"
            <> text currentElement <>
            "</a>"

renderAttributes :: [Attribute] -> String
renderAttributes = concat . map renderAttribute

renderAttribute :: Attribute -> String
renderAttribute = (\attribute -> key attribute <> "=" <> value attribute)

-- * Private Helper Methods

createElement :: ElementKind -> String -> [Attribute] -> [Element] -> Element
createElement kind text attributes children =
    Element {
        kind = kind,
        text = text,
        attributes = attributes,
        children = children
    }

-- * Document Construction Functions

document_ :: [Element] -> Document
document_ = Document

-- * Element Construction Functions

html_ :: [Element] -> Element
html_ childrenElements = createElement Html "" [] childrenElements

head_ :: [Element] -> Element
head_ childrenElements = createElement Head "" [] childrenElements

title_ :: String -> Element
title_ textContent = createElement Title textContent [] []

body_ :: [Element] -> Element
body_ childrenElements = createElement Body "" [] childrenElements

h1_ :: String -> Element
h1_ textContent = createElement H1 textContent [] []

h2_ :: String -> Element
h2_ textContent = createElement H2 textContent [] []

h3_ :: String -> Element
h3_ textContent = createElement H3 textContent [] []

h4_ :: String -> Element
h4_ textContent = createElement H4 textContent [] []

h5_:: String -> Element
h5_ textContent = createElement H5 textContent [] []

h6_ :: String -> Element
h6_ textContent = createElement H6 textContent [] []

p_ :: String -> Element
p_ textContent = createElement P textContent [] []

small_ :: String -> Element
small_ textContent = createElement Small textContent [] []

b_ :: String -> Element
b_ textContent = createElement B textContent [] []

i_ :: String -> Element
i_ textContent = createElement I textContent [] []

a_ :: String -> [Attribute] -> Element
a_ textContent attributes = createElement A textContent attributes []

-- * Attribute Construction Functions

attribute_ :: String -> String -> Attribute
attribute_ = Attribute
