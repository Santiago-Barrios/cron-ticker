const { syncDB } = require("../../tasks/sync-db")

describe('test in Sync-DB ', () => {

    test('should execute the process twice', () => {
        syncDB();
        const times = syncDB();
        console.log('times was called', times);
        expect(times).toBe(2);
    })

})