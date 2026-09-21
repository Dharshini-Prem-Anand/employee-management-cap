using { hr.management as db } from '../db/schema';

@path: '/hr'
service HRService {

    @odata.draft.enabled
    entity Employees as projection on db.Employees;

    entity HRCases as projection on db.HRCases;

    entity OnboardingTasks as projection on db.OnboardingTasks;

    entity CaseComments as projection on db.CaseComments;
}