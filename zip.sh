#!/bin/sh

zip -r store.zip .password-store && gpg -c store.zip && rm store.zip
