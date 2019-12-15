from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status

from .models import Annotation, AnnotationBody, AnnotationTarget, FragmentSelector


class Img2ImgAnnotationRetrieveTest(APITestCase):
    def setUp(self) -> None:
        # image to image
        body = AnnotationBody.objects.create(type='Image', identifier='http://example.org/bodyimg')
        selector = FragmentSelector.objects.create(value='xywh=0,0,50,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetimg', selector=selector)
        self.annotation = Annotation.objects.create(body=body, target=target)

    def test_retrieve(self):
        url = reverse('annotation-detail', args=[self.annotation.id])

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        annotation = response.data

        self.assertSetEqual(set(annotation.keys()), {'@context', 'id', 'type', 'created', 'body', 'target', 'creator'})
        self.assertDictEqual(annotation['body'], {
            'type': 'Image',
            'id': self.annotation.body.identifier
        })
        self.assertDictEqual(annotation['target'], {
            'source': self.annotation.target.source,
            'selector': {
                'type': 'FragmentSelector',
                'value': 'xywh=0,0,50,50'
            }
        })


class Img2TexAnnotationRetrieveTest(APITestCase):
    def setUp(self) -> None:
        # image to text
        body = AnnotationBody.objects.create(type='Image', identifier='http://example.org/bodyimg')
        selector = FragmentSelector.objects.create(value='char=0,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetarticle', selector=selector)
        self.annotation = Annotation.objects.create(body=body, target=target)

        # text to image
        body = AnnotationBody.objects.create(type='TextualBody', value='some comment')
        selector = FragmentSelector.objects.create(value='xywh=0,0,50,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetimg', selector=selector)
        self.tex2img = Annotation.objects.create(body=body, target=target)

        # text to text
        body = AnnotationBody.objects.create(type='TextualBody', value='some comment')
        selector = FragmentSelector.objects.create(value='char=0,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetarticle', selector=selector)
        self.tex2img = Annotation.objects.create(body=body, target=target)

    def test_retrieve(self):
        url = reverse('annotation-detail', args=[self.annotation.id])

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        annotation = response.data

        self.assertSetEqual(set(annotation.keys()), {'@context', 'id', 'type', 'created', 'body', 'target', 'creator'})
        self.assertDictEqual(annotation['body'], {
            'type': 'Image',
            'id': self.annotation.body.identifier
        })
        self.assertDictEqual(annotation['target'], {
            'source': self.annotation.target.source,
            'selector': {
                'type': 'FragmentSelector',
                'value': 'char=0,50'
            }
        })


class Tex2ImgAnnotationRetrieveTest(APITestCase):
    def setUp(self) -> None:
        # text to image
        body = AnnotationBody.objects.create(type='TextualBody', value='some comment')
        selector = FragmentSelector.objects.create(value='xywh=0,0,50,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetimg', selector=selector)
        self.annotation = Annotation.objects.create(body=body, target=target)

        # text to text
        body = AnnotationBody.objects.create(type='TextualBody', value='some comment')
        selector = FragmentSelector.objects.create(value='char=0,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetarticle', selector=selector)
        self.tex2img = Annotation.objects.create(body=body, target=target)

    def test_retrieve(self):
        url = reverse('annotation-detail', args=[self.annotation.id])

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        annotation = response.data

        self.assertSetEqual(set(annotation.keys()), {'@context', 'id', 'type', 'created', 'body', 'target', 'creator'})
        self.assertDictEqual(annotation['body'], {
            'type': 'TextualBody',
            'value': self.annotation.body.value
        })
        self.assertDictEqual(annotation['target'], {
            'source': self.annotation.target.source,
            'selector': {
                'type': 'FragmentSelector',
                'value': 'xywh=0,0,50,50'
            }
        })


class Tex2TexAnnotationRetrieveTest(APITestCase):
    def setUp(self) -> None:
        # text to text
        body = AnnotationBody.objects.create(type='TextualBody', value='some comment')
        selector = FragmentSelector.objects.create(value='char=0,50')
        target = AnnotationTarget.objects.create(source='http://example.org/targetarticle', selector=selector)
        self.annotation = Annotation.objects.create(body=body, target=target)

    def test_retrieve(self):
        url = reverse('annotation-detail', args=[self.annotation.id])

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        annotation = response.data

        self.assertSetEqual(set(annotation.keys()), {'@context', 'id', 'type', 'created', 'body', 'target', 'creator'})
        self.assertDictEqual(annotation['body'], {
            'type': 'TextualBody',
            'value': self.annotation.body.value
        })
        self.assertDictEqual(annotation['target'], {
            'source': self.annotation.target.source,
            'selector': {
                'type': 'FragmentSelector',
                'value': 'char=0,50'
            }
        })


class Tex2TexAnnotationCreateTest(APITestCase):
    def test_create(self):
        data = {
            'body': {
                'type': 'TextualBody',
                'value': 'some comment',
            },
            'target': {
                'source': 'http://example.org/article/1',
                'selector': {
                    'value': 'char=55,60'
                }
            }
        }

        response = self.client.post(reverse('annotation-list'), data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        annotation = Annotation.objects.first()
        self.assertEqual(annotation.body.value, 'some comment')
        self.assertEqual(annotation.target.selector.value, 'char=55,60')


class Img2TexAnnotationCreateTest(APITestCase):
    def test_create(self):
        data = {
            'body': {
                'type': 'Image',
                'id': 'http://example.org/image'
            },
            'target': {
                'source': 'http://example.org/article/1',
                'selector': {
                    'value': 'char=55,60'
                }
            }
        }

        response = self.client.post(reverse('annotation-list'), data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        annotation = Annotation.objects.first()
        self.assertEqual(annotation.body.identifier, 'http://example.org/image')
        self.assertEqual(annotation.target.selector.value, 'char=55,60')


class Tex2ImgAnnotationCreateTest(APITestCase):
    def test_create(self):
        data = {
            'body': {
                'type': 'TextualBody',
                'value': 'Hi there'
            },
            'target': {
                'source': 'http://example.org/image/1',
                'selector': {
                    'value': 'xywh=0,0,55,60'
                }
            }
        }

        response = self.client.post(reverse('annotation-list'), data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        annotation = Annotation.objects.first()
        self.assertEqual(annotation.body.value, 'Hi there')
        self.assertEqual(annotation.target.selector.value, 'xywh=0,0,55,60')


class Img2ImgAnnotationCreateTest(APITestCase):
    def test_create(self):
        data = {
            'body': {
                'type': 'Image',
                'id': 'http://example.org/image'
            },
            'target': {
                'source': 'http://example.org/image/1',
                'selector': {
                    'value': 'xywh=0,0,55,60'
                }
            }
        }

        response = self.client.post(reverse('annotation-list'), data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        annotation = Annotation.objects.first()
        self.assertEqual(annotation.body.identifier, 'http://example.org/image')
        self.assertEqual(annotation.target.selector.value, 'xywh=0,0,55,60')


class Tex2TexWithCreatorAnnotationCreateTest(APITestCase):
    def test_create(self):
        data = {
            'body': {
                'type': 'TextualBody',
                'value': 'some comment',
            },
            'target': {
                'source': 'http://example.org/article/1',
                'selector': {
                    'value': 'char=55,60'
                }
            },
            'creator': 'https://example.org/users/1'
        }

        response = self.client.post(reverse('annotation-list'), data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        annotation = Annotation.objects.first()
        self.assertEqual(annotation.body.value, 'some comment')
        self.assertEqual(annotation.target.selector.value, 'char=55,60')
        self.assertEqual(annotation.creator, 'https://example.org/users/1')
