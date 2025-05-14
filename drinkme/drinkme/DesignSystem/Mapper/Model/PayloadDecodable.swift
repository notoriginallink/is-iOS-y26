extension DS {
    protocol PayloadDecodable {
        init(payload: Payload) throws
    }
}
