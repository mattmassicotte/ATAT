<div align="center">

[![Build Status][build status badge]][build status]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]

</div>

# ATAT
Little library for working with the AT Protocol

The AT Protocol is large and complex. This library mostly just contains currency types useful for decoding some simple responses. It is highly-incomplete and was created really just so I could mess around and learn.

If you are looking for something full-featured, please check out [ATProtoKit](https://github.com/MasterJ93/ATProtoKit).

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/mattmassicotte/ATAT", branch: "main")
]
```

## Usage

```swift
import ATAT

// getFeed call
let data = "..."

let response = ATJSONDecoder().decode(Bsky.Feed.GetFeedResponse.self, from: data)
```

## Contributing and Collaboration

I would love to hear from you! Issues or pull requests work great.

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I use indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/mattmassicotte/ATAT/actions
[build status badge]: https://github.com/mattmassicotte/ATAT/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/mattmassicotte/ATAT
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmattmassicotte%2FATAT%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/mattmassicotte/ATAT/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
