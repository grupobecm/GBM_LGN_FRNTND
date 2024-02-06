# boletera

A new Novek Version.

## Getting Started

mutation CreateEvent {
    CreateEvent(
        input: {
            event_name: "TestEvent1"
            description: "Evento de test"
            start_date: "2024-02-02T16:1:.755Z"
            end_date: "2024-02-20T09:58:15.872Z"
            location: "Locasion test"
            country: "México"
            categories: boletera
            is_for_adult: false
            type: Private
            image: null
        }
    ) {
        _dummy
    }
}
