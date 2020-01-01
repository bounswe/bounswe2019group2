# TrAiders Web Annotation Server
TrAiders Web Annotation Server partially implements 
W3C [Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) and 
[Web Annotation Protocol](https://www.w3.org/TR/annotation-model/). It supports text and image annotation bodies 
for both text and image targets with fragment selectors. This document gives examples on how a client can retrieve and create annotations.

## Annotation Retrieval
TrAiders Web Annotation Server provides a single annotation container available at [https://annotation.traiders.tk/annotations/](https://annotation.traiders.tk/annotations/).
`GET` requests to this endpoint returns the list of existing annotations.
### Example
#### Request
```http
GET https://annotation.traiders.tk/annotations/
```   
#### Response
```json
[
    {
      "@context": "http://www.w3.org/ns/anno.jsonld",
      "id": "https://annotation.traiders.tk/annotations/80/",
      "type": "Annotation",
      "created": "2019-12-24T14:11:35.995189Z",
      "body": {
        "type": "TextualBody",
        "value": "The IOTA Tangle is a stream of interlinked and individual transactions. These transactions are distributed and stored across a decentralised network of participants."
      },
      "target": {
        "source": "https://api.traiders.tk/articles/132/",
        "selector": {
          "type": "FragmentSelector",
          "value": "char=158,176"
        }
      },
      "creator": "https://api.traiders.tk/users/545/"
    },
    {
      "@context": "http://www.w3.org/ns/anno.jsonld",
      "id": "https://annotation.traiders.tk/annotations/85/",
      "type": "Annotation",
      "created": "2019-12-24T16:09:26.328396Z",
      "body": {
        "type": "TextualBody",
        "value": "I like this!"
      },
      "target": {
        "source": "https://media.traiders.tk/img2.jpg",
        "selector": {
          "type": "FragmentSelector",
          "value": "xywh=39.53,38.96,31.88,26.04"
        }
      },
      "creator": "https://api.traiders.tk/users/546/"
    }
]
```
Two examples of textual annotations bodies that were targeted to article image and texts are listed above.

## Annotation Creation
Annotation are created by sending a `POST` request to the annotation server.
If the creation succeeds, the server returns the newly created annotation.
### Example
Creation of an example annotation with a text target and image body:
#### Request
```http
POST https://annotation.traiders.tk/annotations/

{
    "body": {
        "type": "Image",
        "id": "http://example.org/image.png"
    },
    "target": {
        "source": "https://traiders.tk/articles/5",
        "selector": {
            "value": "char=10,20"
        }
    }
}
```
#### Response
```json
{
  "@context": "http://www.w3.org/ns/anno.jsonld",
  "id": "https://annotation.traiders.tk/annotations/23/",
  "type": "Annotation",
  "created": "2019-12-25T16:09:26.328396Z",
  "body": {
    "type": "Image",
    "id": "http://example.org/image.png"
  },
  "target": {
    "source": "https://traiders.tk/articles/5",
      "selector": {
      "value": "char=10,20"
    }
  }
}
```

## Fragment Selection
TrAiders Web Annotation Server supports fragment selectors for both image and text targets.
### Text Fragment Selection
W3C convention for selecting text fragments can be used. For example, a fragment selector with the value of `char=50,100` 
would mean the substring of the text starting from 50th character to 100th was targeted for annotation.
### Image Fragment Selection
Image fragment selection works similarly. A fragment selector with the value of `xywh=10,15,30,35` will target the 
rectangle of size 30x35 with its top left corner on the pixel (10, 15). 

## Limitations
TrAiders Web Annotation Server only implements annotations with image and text bodies targeted to image and text bodies.
It does not support other multimedia types such as video and audio. Annotations are limited to only a single body and target. Multiple targets or bodies are not supported.